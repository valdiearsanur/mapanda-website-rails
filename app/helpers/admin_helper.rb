module AdminHelper
    def title
        base_title = "MaPanda Admin Panel"
        if @title.nil?
            base_title
        else
            "#{@title} | #{base_title}"
        end
    end
end
