class UserDecorator < Draper::Decorator
  delegate_all

  def image
    if model.image_url.present?
      h.image_tag(model.image_url, width: "50px",height: "50px")
    else
    end
  end
end
