# A grid that overrides the `get_data` endpoint in order to send a command to the client
module Grid
  class FeedbackOnDataLoad < Netzke::Basepack::Grid
    def configure(c)
      super
      c.model = 'Book'
    end

    endpoint :server_read do |params,this|
      super(params,this)
      this.netzke_feedback "Data loaded!"
    end
  end
end
