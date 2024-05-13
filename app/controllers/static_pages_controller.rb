class StaticPagesController < ApplicationController

	def adblock_notice
		render layout: "adblock_notice"
	end
end