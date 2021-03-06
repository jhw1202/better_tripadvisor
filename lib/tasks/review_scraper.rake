namespace :scrape do

  desc "Visit link and scrape review info"
  task :reviews => :environment do

    require 'open-uri'
    url = ARGV.last

    page = Nokogiri::HTML(open(url))
    city = City.find_or_create_by_name(page.css('div.popRanking').first.text.split('in ')[1].chomp)

    page.css('div.listing').each do |review_info|
      review = Review.new(city_id:city.id)

      review.title = review_info.css('a.property_title').text

      review.link = review_info.css('a.property_title').attribute('href').value

      review.average = review_info.css('span.rate').children[1].attribute('alt').value.match(/(\d|\d\.\d?)\s.*/)[1].to_f

      review.num_of_reviews = review_info.text.match(/(\d*,?\d+)(\sreviews)/)[1].delete(',').to_i

      data = {}

      data['award'] = review_info.css('span.tc.sprite-badge_tc')[0].text.split(/\n/).join(' ') rescue nil
      # data['award']['link'] = "http://tripadvisor.com" + review_info.css('span.tc.sprite-badge_tc').css('a').attribute('href').value rescue nil

      data['guide'] = review_info.css('div.guidePromo').text.chomp rescue nil

      review.data = data
      review.save
    end

    task url.to_sym do ; end
  end
end

