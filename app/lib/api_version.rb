# Our ApiVersion class implements server-driven content negotiation where the client
# (user agent) informs the server what media types it understands by providing an
# Accept HTTP header.
class ApiVersion
  attr_reader :version, :default
  # The ApiVersion class accepts a version and a default flag on initialization.
  def initialize(version, default = false)
    @version = version
    @default = default
  end

  # check whether version is specified or is default
  def matches?(request)
    check_headers(request.headers) || default
  end

  private

  def check_headers(headers)
    # check version from Accept headers; expect custom media type `invoices`
    # According to the Media Type Specification, you can define your own media
    # types using the vendor tree i.e. application/vnd.example.resource+json.
    accept = headers[:accept]
    accept&.include?("application/vnd.invoices.#{version}+json")
  end
end