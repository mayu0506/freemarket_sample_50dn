crumb :root do
  link "メルカリ", root_path
end

crumb :categorys do
  link "カテゴリー一覧", categorys_path
  parent :root
end

# 商品詳細ページ（サーバーサイド完了後設定）
# crumb :show do
#   link ???
#   parent :root
# end

# 以下マイページ

crumb :show do
  link "マイページ", root_path
  parent :root
end

crumb :profile do
  link "プロフィール", users_path
  parent :show
end

crumb :identification do 
  link "本人情報の登録", identification_users_path
  parent :show
end

crumb :logout do
  link "ログアウト", users_path
  parent :show
end

crumb :payments do
  link "支払い方法", users_path
  parent :show
end


# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
