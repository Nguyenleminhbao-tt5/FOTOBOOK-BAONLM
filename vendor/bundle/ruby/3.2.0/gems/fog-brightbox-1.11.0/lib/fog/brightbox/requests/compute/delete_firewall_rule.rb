module Fog
  module Brightbox
    class Compute
      class Real
        # Destroy the firewall rule.
        #
        # @param [String] identifier Unique reference to identify the resource
        # @param [Hash] options
        # @option options [Boolean] :nested passed through with the API request. When true nested resources are expanded.
        #
        # @return [Hash] if successful Hash version of JSON object
        #
        # @see https://api.gb1.brightbox.com/1.0/#firewall_rule_delete_firewall_rule
        #
        def delete_firewall_rule(identifier, options = {})
          return nil if identifier.nil? || identifier == ""
          wrapped_request("delete", "/1.0/firewall_rules/#{identifier}", [202], options)
        end
      end
    end
  end
end
