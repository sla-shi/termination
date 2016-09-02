class Record < ActiveRecord::Base
    def created_date
        self.created_date.to_s(:pdf)
    end
end
