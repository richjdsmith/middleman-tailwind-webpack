module ImagesHelper
  def svg_tag(file_name, attributes = {})
    root       = Middleman::Application.root
    file_path  = File.join(root, config.source, config.images_dir, file_name)
    svg        = File.exist?(file_path) ? File.read(file_path) : 'SVG not found'
    image_name = file_name.gsub(/\.svg$/, '')

    add_attributes_to_opening_tag(svg, attributes)
    # Prevent common classes (st|cl) in different icons:
    svg.gsub!(/(st|cl)(?<n>\d+)/, "#{image_name}\\k<n>").html_safe
  end

  private

  def add_attributes_to_opening_tag(element, attributes)
    element.gsub!(/\s(?:height|width|x|y)="\w*"/, '')
    new_opening_tag = '<svg '
    attributes.each_key do |attribute|
      new_opening_tag += "#{attribute}=\"#{attributes[attribute]}\" "
    end
    element.gsub!(/<svg\s/, new_opening_tag)
  end
end
