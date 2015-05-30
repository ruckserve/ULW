module ApplicationHelper
  def flash_class(type, dismissible=true)
    default_classes = %w(alert)
    default_classes << case type.to_sym
    when :success
      'alert-success'
    when :warning
      'alert-warning'
    when :alert
      'alert-danger'
    when :notice
      'alert-info'
    else
      nil
    end
    default_classes << 'alert-dismissible' if dismissible
    default_classes.compact.join(' ')
  end
end
