require 'rails_helper'

RSpec.describe 'pwb/sections/contact_us', type: :view do
  include Pwb::ApplicationHelper

  before do
    # @website = FactoryGirl.create(:pwb_website)
    view.extend Pwb::ApplicationHelper
    # https://github.com/rspec/rspec-rails/issues/396
    # https://stackoverflow.com/questions/19282240/rspec-view-tests-cant-find-partials-that-are-in-base-namespace
    # can use below to test other views
    # view.lookup_context.view_paths.push 'app/themes/berlin/views/'
    # -already add below in spec_helper
    # ActionController::Base.prepend_view_path "#{Pwb::Engine.root}/app/themes/default/views/"
  end



  before(:each) do
    assign(:content_to_show, ["form_and_map"])
    assign(:current_agency, FactoryGirl.create(:pwb_agency, company_name: 'my re'))
  end

  it 'renders contact-us form successfully' do
    render
    expect(rendered).to have_selector("form.mi_form")
  end

end
