require File.dirname(__FILE__) + '/../spec_helper'
require 'sdp/description'

describe SDP::Description do
  before :each do
    @sdp = SDP::Description.new
  end

  it "initializes with the protoco_version value set" do
    @sdp.protocol_version.should == 0
  end

  context "can add and retrieve fields" do
    it "attribute" do
      new_values = { :attribute => 'rtpmap',
        :value => "99 h263-1998/90000" }
      @sdp.attributes = new_values
      @sdp.attributes.first.should == new_values
    end

    it "bandwidth_type" do
      @sdp.bandwidth = :CT
      @sdp.bandwidth.should == :CT
    end

    it "bandwidth" do
      @sdp.bandwidth = 100
      @sdp.bandwidth.should == 100
    end

    it "network_type" do
      @sdp.network_type = :IN
      @sdp.network_type.should == :IN
    end

    it "address_type" do
      @sdp.address_type = :IP4
      @sdp.address_type.should == :IP4
    end

    it "connection_address" do
      @sdp.address_type = 'localhost'
      @sdp.address_type.should == 'localhost'
    end

    it "email_address" do
      @sdp.email_address = 'me@me.com'
      @sdp.email_address.should == 'me@me.com'
    end
  
    it "encryption_method" do
      @sdp.encryption_method = 'clear'
      @sdp.encryption_method.should == 'clear'
    end
  
    it "encryption_key" do
      @sdp.encryption_key = 'password'
      @sdp.encryption_key.should == 'password'
    end
  
    it ":media_description" do
      new_values = { :media => 'audio',
        :port => 12345,
        :protocol => 'RTP/AVP',
        :format => 99 }
      @sdp.media_descriptions = new_values
      @sdp.media_descriptions.first.should == new_values
    end

    it "username" do
      @sdp.username = "jdoe"
      @sdp.username.should == "jdoe"
    end

    it "id" do
      @sdp.id = 2890844526
      @sdp.id.should == 2890844526
    end

    it "version" do
      @sdp.version = 2890842807
      @sdp.version.should == 2890842807
    end

    it "unicast_address" do
      @sdp.unicast_address = "10.47.16.5"
      @sdp.unicast_address.should == "10.47.16.5"
    end

    it "phone_number" do
      @sdp.phone_number = "+1 555 123 4567"
      @sdp.phone_number.should == "+1 555 123 4567"
    end
  
    it "repeat_interval" do
      @sdp.repeat_interval = 12345
      @sdp.repeat_interval.should == 12345
    end

    it "active_duration" do
      @sdp.active_duration = 12345
      @sdp.active_duration.should == 12345
    end

    it "offsets_from_start_time" do
      @sdp.offsets_from_start_time = 99
      @sdp.offsets_from_start_time.should == 99
    end

    it "session_information" do
      @sdp.information = "This is a session"
      @sdp.information.should == "This is a session"
    end

    it "session_name" do
      @sdp.name = "This is a session"
      @sdp.name.should == "This is a session"
    end
  
    it "time_zone_adjustment" do
      new_values = { :adjustment_time => 99112299,
        :offset => 99 }
      @sdp.time_zone_adjustment = 12345
      @sdp.time_zone_adjustment.should == 12345
    end

    it "time_zone_offset" do
      @sdp.time_zone_offset = 10
      @sdp.time_zone_offset.should == 10
    end
  
    it "start_time" do
      @sdp.start_time = 99112299
      @sdp.start_time.should == 99112299
    end

    it "stop_time" do
      @sdp.stop_time = 99999999
      @sdp.stop_time.should == 99999999
    end

    it "uri" do
      @sdp.uri = "http://localhost"
      @sdp.uri.should == "http://localhost"
    end

    it "protocol_version" do
      @sdp.protocol_version = 0
      @sdp.protocol_version.should == 0
    end
  end

  context "can add and retrieve > 1 field of same type" do
    it ":attribute" do
      @sdp.attributes = { :attribute => 'recvonly', :value => "" }
      @sdp.attributes = { :attribute => 'rtpmap', :value => '99 h263-1998/90000' }

      @sdp.attributes.class.should == Array
      @sdp.attributes[0].should == { :attribute => 'recvonly', :value => "" }
      @sdp.attributes[1].should == { :attribute => 'rtpmap', :value => '99 h263-1998/90000' }
    end

    it ":media_description" do
      new_values = []
      new_values << { :media => 'audio',
        :port => 12345,
        :protocol => 'RTP/AVP',
        :format => 99 }
      @sdp.media_descriptions = new_values[0]

      new_values << { :media => 'video',
        :port => 5678,
        :protocol => 'RTP/AVP',
        :format => 33 }
      @sdp.media_descriptions = new_values[1]

      @sdp.media_descriptions.class.should == Array
      @sdp.media_descriptions[0].should == new_values[0]
      @sdp.media_descriptions[1].should == new_values[1]
    end
  end
end