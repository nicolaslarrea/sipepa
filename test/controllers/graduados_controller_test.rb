require "test_helper"

describe GraduadosController do
  it "must get index" do
    get graduados_index_url
    must_respond_with :success
  end

end
