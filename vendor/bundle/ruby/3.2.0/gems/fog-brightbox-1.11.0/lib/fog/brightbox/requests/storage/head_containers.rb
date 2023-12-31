module Fog
  module Brightbox
    class Storage
      class Real
        # List number of containers and total bytes stored
        #
        # ==== Returns
        # * response<~Excon::Response>:
        #   * headers<~Hash>:
        #     * 'X-Account-Container-Count'<~String> - Count of containers
        #     * 'X-Account-Bytes-Used'<~String> - Bytes used
        def head_containers
          request(
            expects: 204,
            method: "HEAD",
            path: "",
            query: { "format" => "json" }
          )
        end
      end
    end
  end
end
