module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Toponymes").join(" - ") unless parts.empty?
      end
    end
  end
end
