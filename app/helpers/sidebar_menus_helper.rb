module SidebarMenusHelper

    def sidebar_menu 
        if current_account.role.name == "Superuser"
            render "layouts/partials/dashboard/navs/superuser-nav"
        elsif current_account.role.name == "Prestataire"
            render "layouts/partials/dashboard/navs/prestataire-nav"
        elsif current_account.role.name == "Patient"
            render "layouts/partials/dashboard/navs/patient-nav"

        elsif current_account.role.name == "Client"
            render "layouts/partials/dashboard/navs/customer-nav"
        elsif current_account.role.name == "Taximan"
            render "layouts/partials/dashboard/navs/taximan-nav"
       

        else
            render "layouts/partials/dashboard/navs/superuser-nav"


        end

    end

end