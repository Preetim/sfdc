

Before do
  $seed = Seed.new
  if !$check
      $seed.seed_data
      $check = true
    end
  end

  After('@seed') do  |scenario|
    base_page=BasePage.new(Capybara.current_session)
    base_page.logout
    $seed.delete_opportunity $create_opp['opp_name']
    $seed.delete_contact $create_opp[:contact]['new_contact_fname']

    #if(scenario.failed?)
    #  @browser.driver.save_screenshot("features/reports.html/#{scenario.__id__}.png")
    #  embed("#{scenario.__id__}.png", "image/png", "SCREENSHOT")
    #end
  end

  Before('@integration') do |scenario|
      $seed.seed_for_integration
  end

  After('@integration') do  |scenario|
    $seed.delete_opportunity $create_opp['opp_name']
    $seed.delete_contact $create_opp[:contact]['new_contact_fname']
  end