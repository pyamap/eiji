class MembersController < ApplicationController

	def index
		@members = Member.order("name")
	end 

	def search
		@members = Member.search(params[:q])
		render "index"
	end

	#会員情報の詳細
	def show	
		@member = Member.find(params[:id])
	end
	#新規作成フォーム
	def new	
		@member = Member.new(birthday: Date.new(1980, 1,1))
	end

	#更新フォーム
	def edit	
		@member = Member.find(params[:id])
	end

	#会員の新規登録
	def create
		params.permit!	
		@member = Member.new(params[:member])
		if @member.save
			redirect_to @member, notice: "会員を登録しました。"
		else
			render "new"
		end
	end

	def update	
		params.permit!
		@member = Member.find(params[:id])
		@member.assign_attributes(params[:member])
		if @member.save
			redirect_to @member, notice: "会員情報を更新しました。"
		else
			render "edit"
		end
	end
	#会員の削除
	def destroy	
		@member = Member.find(params[:id])
		@member.destroy
		redirect_to :members, notice: "会員を削除しました。"
	end

end












