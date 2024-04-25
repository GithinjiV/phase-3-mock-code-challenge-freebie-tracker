class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies
    def freebies
        self.freebies
    end
    def devs
        self.devs
    end

    def give_freebies(dev:dev, item_name:item, value:value)
        Freebie.create(item_name:item, value:value, dev:dev, company:self)
    end

    def self.oldest_company
        self.order(:founding_year).first
    end
end
