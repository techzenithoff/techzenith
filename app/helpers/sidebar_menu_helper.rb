module SidebarMenuHelper

    def sidebar_menu 
        if current_user.role.name == "superuser"
            render "layouts/partials/dashboard/navs/superuser-nav"
        elsif current_user.role.name == "Prestataire"
            render "layouts/partials/dashboard/navs/prestataire-nav"
        elsif current_user.role.name == "Patient"
            render "layouts/partials/dashboard/navs/patient-nav"
       

        else
            render "layouts/partials/dashboard/navs/superuser-nav"


        end

    end

end