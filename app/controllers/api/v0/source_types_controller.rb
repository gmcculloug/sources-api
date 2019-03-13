module Api
  module V0
    class SourceTypesController < ApplicationController
      include Api::V0::Mixins::IndexMixin
      include Api::V0::Mixins::ShowMixin

      def create
        source_type = model.create!(params_for_create)
        Sources::Api::Events.raise_event("#{model}.create", source_type.as_json)
        render :json => source_type, :status => :created, :location => instance_link(source_type)
      end
    end
  end
end
