class Protected::OdaniaPoll::PollsController < ProtectedController
	before_action :set_poll, only: [:edit, :update, :destroy]
	before_action :set_public_poll, only: [:show, :vote]

	# GET /public/polls
	def index
		@polls = OdaniaPoll::Poll.where(user_id: current_user.id)
	end

	# GET /public/polls/1
	def show
	end

	# GET /public/polls/new
	def new
		@poll = OdaniaPoll::Poll.new
		@poll.answers.build
		@poll.answers.build
	end

	# GET /public/polls/1/edit
	def edit
		@poll.answers.build
	end

	# POST /public/polls
	def create
		@poll = OdaniaPoll::Poll.new(public_poll_params)
		@poll.user_id = current_user.id

		if @poll.save
			redirect_to protected_odania_poll_polls_path, notice: 'Poll was successfully created.'
		else
			render :new
		end
	end

	# PATCH/PUT /public/polls/1
	def update
		if @poll.update(public_poll_params)
			redirect_to protected_odania_poll_polls_path, notice: 'Poll was successfully updated.'
		else
			render :edit
		end
	end

	# DELETE /public/polls/1
	def destroy
		@poll.destroy
		redirect_to protected_odania_poll_polls_path, notice: 'Poll was successfully destroyed.'
	end

	def vote
		if @user_vote.nil?
			@poll.votes.create!(user_id: current_user.id, answer_id: params[:answer_id])
		end

		redirect_to protected_odania_poll_poll_path(@poll)
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_poll
		@poll = OdaniaPoll::Poll.where(id: params[:id], user_id: current_user.id).first
		redirect_to protected_odania_poll_poll_path if @poll.nil?
	end

	def set_public_poll
		@poll = OdaniaPoll::Poll.where(id: params[:id]).first
		redirect_to protected_odania_poll_poll_path if @poll.nil?

		@user_vote = @poll.votes.where(user_id: current_user.id).first
	end

	# Only allow a trusted parameter "white list" through.
	def public_poll_params
		params.require(:odania_poll_poll).permit(:user_id, :question, :due_date, :answers_attributes => [:id, :answer])
	end
end
