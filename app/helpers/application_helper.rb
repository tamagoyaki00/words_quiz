module ApplicationHelper
  def default_meta_tags
    {
      site: "世代別言葉クイズ",
      title: "世代別言葉クイズ！",
      charset: "utf-8",
      description: "世代別で流行った言葉のクイズです",
      keywords: "クイズ, 世代, 言葉, 懐かしい",
      canonical: request.original_url,
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: "website",
        url: request.original_url,
        image: "#{root_url}home2.png",
        locale: "ja_JP"
      },
      twitter: {
        card: "summary_large_image",
        image: "#{root_url}home2.png"
      }
    }
  end
end
