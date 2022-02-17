module TwitsComments
    extend ActiveSupport::Concern

included do
    def load_twit_comments
        @comment = @twit.comments.build
        @comments ||= @twit.comments.order(created_at: :desc).page params[:page]
    end
end
end