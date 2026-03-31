class Rack::Attack
  # Throttle lead form submissions to 5 per 5 minutes per IP
  throttle("leads/ip", limit: 5, period: 5.minutes) do |req|
    req.ip if req.path == "/leads" && req.post?
  end

  # Throttle admin login attempts to 5 per 20 seconds per IP
  throttle("admin_login/ip", limit: 5, period: 20.seconds) do |req|
    req.ip if req.path == "/admin/login" && req.post?
  end

  self.throttled_responder = lambda do |_req|
    [429, { "Content-Type" => "text/plain" }, ["Too many requests. Please try again later.\n"]]
  end
end
