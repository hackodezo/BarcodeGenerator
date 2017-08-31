class QrCodesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new

  end

  def create
    image = nil
    url = "https://api.qrserver.com/v1/create-qr-code/"
    type = params[:type]
    case type
      when "url"
        @image = url + "?data=#{params[:url_link]}&size=220x220&margin=0"
      when "text"
        @image = url+ "?data=#{params[:text_content]}&size=220x220&margin=0"
      when "contact"
        full_name = params[:first_name] +" "+ params[:last_name]
        @image = url + "?data=BEGIN%3AVCARD%0AVERSION%3A2.1%0AFN%3A#{full_name}%0AN%3A#{params[:last_name]}%3B#{params[:first_name]}%0ATITLE%3A#{params[:title]}%0ATEL%3BCELL%3A#{params[:mobile]}%0ATEL%3BWORK%3BVOICE%3A#{params[:business_phone]}%0ATEL%3BHOME%3BVOICE%3A#{params[:phone]}%0AEMAIL%3BHOME%3BINTERNET%3A#{params[:personal_email]}%0AEMAIL%3BWORK%3BINTERNET%3A#{params[:business_email]}%0AURL%3A#{params[:website]}%0AADR%3A%3B%3B#{params[:street]}%3B#{params[:city]}%3B%3B#{params[:zip_code]}%3B#{params[:country]}%0AORG%3A#{params[:company]}%0AEND%3AVCARD%0A&size=220x220&margin=0"
      when "sms"
        @image = url + "?data=SMSTO%3A#{params[:country_code]}#{params[:area_code]}#{params[:phone_number]}%3A#{params[:message_content]}&size=220x220&margin=0"
      when "call"
        @image = url + "?data=tel%3A#{params[:country_code_call]}#{params[:area_code_call]}#{params[:phone_number_call]}&size=220x220&margin=0"
      when "email"
        @image = url + "?data=MATMSG%3ATO%3A#{params[:email_email]}%3BSUB%3A#{params[:subject]}%3BBODY%3A#{params[:email_content]}%3B%3B&size=220x220&margin=0"
      when "event"
        @image = url + "?data=BEGIN%3AVEVENT%0ASUMMARY%3Ahacker%0ADTSTART%3A20170801T193000Z%0ADTEND%3A20170816T232800Z%0AEND%3AVEVENT&size=220x220&margin=0"
      when "wifi"
        @image = url + "?data=WIFI%3AT%3A#{params[:encryption]}%3BS%3A#{params[:network_name]}%3BP%3A#{params[:password]}%3B%3B&size=220x220&margin=0"
    end
    respond_to do |format|
      format.js{}
    end
  end
end