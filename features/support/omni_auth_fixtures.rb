module OmniAuthFixtures
  def self.facebook_mock
    {"provider"=>"facebook",
          "uid"=>"12434235235",
          "info"=>
            {"email"=>"grodon.ramsay@mail.com",
            "first_name"=>"Grodon",
            "last_name"=>"Ramsay",
            "image"=>"jberg.png"},
          "credentials"=>
            {"token"=>
                "123456789",
            "expires_at"=>12345,
            "expires"=>true},
          "extra"=>
            {"raw_info"=>
                {"first_name"=>"Grodon",
              "last_name"=>"Ramsay",
              "email"=>"grodon.ramsay@mail.com",
              "id"=>"21235235"}}}
  end
end