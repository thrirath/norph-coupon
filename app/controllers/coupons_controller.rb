class CouponsController < ApplicationController
  def index
  	@coupons = Coupons.all
  end

  def add
  end

  def generate
  	prefix = params[:prefix]
	plan = params[:plan]
	exp_date = params[:expire_date]
	amount = params[:amount].to_i
	desc = params[:desc]
	for_rand_str = [(0..9), ('A'..'Z')].map{ |i| i.to_a }.flatten
	
	(1..amount).each do |i|
		c = Coupons.new
		rand_str = (1..6).map{ for_rand_str[rand(for_rand_str.length)] }.join
		c.code = prefix + rand_str +i.to_s.rjust(3,'0')
		c.planid = plan
		c.activate = 'no'
		c.other_desc = desc
		c.expire_date = exp_date
		c.save
	end

	redirect_to coupons_index_path
	
  end

  def show
	@coupon = Coupons.find(params[:cid])
  end

  def edit
  	@coupon = Coupons.find(params[:cid])
  end

  def update
  	@coupon = Coupons.find(params[:cid])
	@coupon.code = params[:code]
	@coupon.planid = params[:plan]
	@coupon.expire_date = params[:expire_date]
	@coupon.other_desc = params[:desc]
	@coupon.save
  	redirect_to coupons_index_path
  end

  def delete
  	@coupon = Coupons.find(params[:cid])
	@coupon.destroy
	redirect_to coupons_index_path
  end
end
