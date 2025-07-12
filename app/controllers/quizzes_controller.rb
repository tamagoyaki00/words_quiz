class QuizzesController < ApplicationController
  # クイズの開始（セッションの初期化）
  def start_quiz
    category_id = params[:category_id]
    @category = Category.find(category_id)

    # セッションにクイズ情報を初期化
    session[:quiz_category_id] = @category.id
    # そのカテゴリーの問題IDをランダムに5つ選んでセッションに保存
    session[:question_ids] = Question.where(category_id: category_id).pluck(:id).sample(5)
    session[:current_question_index] = 0
    session[:correct_answers_count] = 0
    Rails.logger.debug "--- start_quiz ---"
    Rails.logger.debug "session[:quiz_category_id]: #{session[:quiz_category_id]}"
    Rails.logger.debug "session[:question_ids]: #{session[:question_ids]}"
    Rails.logger.debug "session[:current_question_index]: #{session[:current_question_index]}"
    Rails.logger.debug "session[:correct_answers_count]: #{session[:correct_answers_count]}"
    Rails.logger.debug "--- end start_quiz ---"

    # 最初の問題表示ページへリダイレクト
    redirect_to quiz_question_path
  end

  # 現在の問題を表示
  def show_question
    # セッションからクイズの状態を取得
    quiz_category_id = session[:quiz_category_id]
    question_ids = session[:question_ids]
    current_index = session[:current_question_index]


    # セッション情報がない場合、不正なアクセスとしてリダイレクト
    unless quiz_category_id && question_ids && current_index.present?
      redirect_to categories_path, alert: "クイズが開始されていません。" and return
    end

    # クイズが終了しているかチェック
    if current_index >= question_ids.size
      redirect_to quiz_result_path and return # ここも quiz_result_path に変更
    end

    # 現在の問題を取得
    @category = Category.find(quiz_category_id)
    @question = Question.find(question_ids[current_index])
    @shuffled_choices = @question.choices.shuffle
  end

  # 回答を処理し、次の問題へ（または結果へ）
  def answer
    selected_choice_id = params[:selected_choice_id]

    unless selected_choice_id.present?
      flash[:alert] = "選択肢を選んでください。"
      redirect_to quiz_question_path and return
    end

    # セッションから現在の問題と状態を取得
    quiz_category_id = session[:quiz_category_id]
    question_ids = session[:question_ids]
    current_index = session[:current_question_index]

    # セッション情報がない場合、不正なアクセスとしてリダイレクト
    unless quiz_category_id && question_ids && current_index.present?
      redirect_to categories_path, alert: "クイズが開始されていません。" and return
    end

    selected_choice = Choice.find(selected_choice_id)
    # 正誤判定と正解数の更新
    if selected_choice.correct_answer?
      session[:correct_answers_count] += 1
    end


    session[:current_question_index] += 1

    # クイズが終了したかチェック
    if session[:current_question_index] >= session[:question_ids].size
      # クイズ終了 -> 結果ページへ
      if session[:correct_answers_count] == session[:question_ids].size
        redirect_to quiz_result_perfect_path
      else
        redirect_to quiz_result_path
      end
    else
      # 次の問題へ
      redirect_to quiz_question_path
    end
  end

  # クイズの結果表示
  def result
    set_quiz_result_data
    # セッションのクイズ情報をクリア
    clear_quiz_session
  end


  def result_perfect
    set_quiz_result_data
    # セッションのクイズ情報をクリア
    clear_quiz_session
  end

  private

  # クイズセッション情報をクリアするヘルパー
  def clear_quiz_session
    session.delete(:quiz_category_id)
    session.delete(:question_ids)
    session.delete(:current_question_index)
    session.delete(:correct_answers_count)
  end

  def set_quiz_result_data
    @total_questions = session[:question_ids]&.size || 0
    @correct_count = session[:correct_answers_count] || 0

    if session[:quiz_category_id].present?
      @category = Category.find(session[:quiz_category_id])
    else
      @category = nil
    end
  end
end
