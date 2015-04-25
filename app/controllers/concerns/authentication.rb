module Authentication
  extend ActiveSupport::Concern

  included do
    def current_user
      @current_user ||= Child.first
    end

    def child
      current_user
    end

    def parent
      current_user.parent
    end

    helper_method :current_user, :child, :parent
  end
end
