module ApplicationHelper

  def svg(name)
  file_path = "#{Rails.root}/app/assets/images/#{name}.svg"
  if File.exists?(file_path)
    cache { File.read(file_path).html_safe }
  else
    '(not found)'
  end
end

end
