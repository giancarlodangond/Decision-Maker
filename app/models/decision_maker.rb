require_relative "../../config/environment"

def make_decision(o1, o2, o3, o4, o5)
  options = [o1, o2, o3, o4, o5]
  item = options[rand(options.length)]
end

