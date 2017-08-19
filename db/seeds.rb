User.create(
  email: 'hhernanni@gmail.com',
  nickname: 'hhernanni',
  name: 'Hugo Hernani',
  password: "12341234")

application = Doorkeeper::Application.create(
  name: "API Dev - AccessPoint",
  redirect_uri: 'urn:ietf:wg:oauth:2.0:oob')
