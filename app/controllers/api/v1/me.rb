module API
  module V1
    class Me < API::V1::RootV1
      include API::V1::Defaults

      resource :me, desc: 'Operations about the current user' do
        oauth2
        get '/' do
          {
            id: current_user.id.to_s,
            user: {
              email: current_user.email,
              name: current_user.name
            }
          }
        end

        params do
          optional :email, type: String, desc: 'User email'
          optional :name, type: String, desc: 'User name'
          optional :demo_value, type: String, values: ['value 1', 'value 2', '3'], default: 'value 1', desc: 'Special value list'
        end
        oauth2 'write_user'
        put '/' do
          declared_p = declared(params, include_missing: false)
          demo_value = declared_p.delete(:demo_value)

          current_user.update_attributes(declared_p)
          {
            id: current_user.id.to_s,
            user: {
              value: demo_value,
              email: current_user.email,
              name: current_user.name
            }
          }
        end
      end
    end
  end
end
