module ApplicationHelper
  def merge_params(h)
    hash = {}
    # make a copy of params into hash
    params.each do |key, value|
      hash[key] = value
    end
    # replace existing keys from h
    h.each do |k, v|
      hash[k] = v
    end
    hash
  end
end
