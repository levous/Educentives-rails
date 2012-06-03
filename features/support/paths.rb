module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'
    when /^that company's show page$/
      company_path(@company)
    when /^the "([^"]*)" company show page$/
      company_path(Company.where(name: $1).first)
    when /^the "([^"]*)" company notifications page$/
      company_notifications_path(Company.where(name: $1).first)
    when /^that company's new web property page$/
      new_company_web_property_path(@company)
    when /^that web property's show page$/
      company_web_property_path(@web_property.company, @web_property)
    when /^that web property's edit page$/
      edit_company_web_property_path(@web_property.company, @web_property)
    when /^that web property's publish history page$/
      company_web_property_change_history_path(@web_property.company, @web_property)
    when /^that web property's "([^"]*)" approvals page$/
      company_web_property_approval_path(@web_property.company, @web_property, SatelliteRule.where(name: $1).one)
    when /^that web property's approvals page$/
      company_web_property_approvals_path(@web_property.company, @web_property)
    when /^that web property's campaigns page$/
      company_web_property_campaigns_path(@web_property.company, @web_property)
    when /^that web property's new (.*) rule page$/
      send("new_company_web_property_#{$1.gsub(' ','_')}_rule_path", @web_property.company, @web_property)
    when /^that web property's event based rules page$/
      company_web_property_event_based_rules_path(@web_property.company, @web_property)
    when /^that web property's page load rules page$/
      company_web_property_page_load_rules_path(@web_property.company, @web_property)
    when /^that web property's direct call rules page$/
      company_web_property_direct_call_rules_path(@web_property.company, @web_property)
    when /^that web property's default rules page$/
      company_web_property_default_rules_path(@web_property.company, @web_property)
    when /^new web property page$/
      new_web_property_path
    when /^that company's edit page$/
      edit_company_path(@company)
    when /^that web property's embed code s3 page$/
      s3_company_web_property_embed_codes_path(@web_property.company, @web_property)
    when /^that web property's embed code ftp page$/
      ftp_company_web_property_embed_codes_path(@web_property.company, @web_property)
    when /^that direct call rule's edit page$/
      edit_company_web_property_direct_call_rule_path(@web_property.company, @web_property, @direct_call_rule)
    when /^that page load rule's edit page$/
      edit_company_web_property_page_load_rule_path(@web_property.company, @web_property, @page_load_rule)
    when /^that default rule's edit page$/
      edit_company_web_property_default_rule_path(@web_property.company, @web_property, @default_rule)
    when /^that event based rule's edit page$/
      edit_company_web_property_event_based_rule_path(@web_property.company, @web_property, @event_based_rule)
    when /^that google analytics account's edit page$/
      edit_company_web_property_google_analytics_account_path(@web_property.company, @web_property, @google_analytics_account)
    when /^that site catalyst account's edit page$/
      edit_company_web_property_site_catalyst_account_path(@web_property.company, @web_property, @site_catalyst_account)
    when /^the purchase page$/
      purchase_path
    when /^that order's summary page$/
      summary_order_path(@customer)
    when /^that order's show page$/
      order_path(@customer)
    when /^that customer's show page$/
      customer_path(@customer)
    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)