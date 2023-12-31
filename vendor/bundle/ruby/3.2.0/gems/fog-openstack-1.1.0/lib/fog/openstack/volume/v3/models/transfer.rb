require 'fog/openstack/volume/models/transfer'

module Fog
  module OpenStack
    class Volume
      class V3
        class Transfer < Fog::OpenStack::Volume::Transfer
          identity :id

          attribute :auth_key, :aliases => 'authKey'
          attribute :created_at, :aliases => 'createdAt'
          attribute :name
          attribute :volume_id, :aliases => 'volumeId'
        end
      end
    end
  end
end
