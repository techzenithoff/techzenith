class DashboardController < ApplicationController
	before_action :authenticate_account!
	layout("admin")
	def index
		#@total_orders = Order.count
		#@total_subscriptions = Subscription.count
		#@total_taximen = Taximan.count
		#@total_customers = Customer.count
	end
	def show
	end
end