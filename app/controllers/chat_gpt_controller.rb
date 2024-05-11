class ChatGptController < ApplicationController
  def index
    @response = params[:prompt].present? ? fetch_gpt_response(params[:prompt]) : nil
    puts @respone
  end

  private

	def fetch_gpt_response(prompt)
	  openai = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])
	  prompt = generate_recommendation_prompt
	  response = openai.chat(
	    parameters: {
		model: "gpt-3.5-turbo", # Required.
		messages: [{ role: "user", content: prompt}], # Required.
		temperature: 0.7,
	    })
		response.dig("choices", 0, "message", "content")
	
	end
	  
	def generate_recommendation_prompt
  # Fetch movie titles that have corresponding records in the Showings table
  films = Movie.joins(:showings).distinct.pluck(:title)

  prompt = "I loved #{prompt} Recommend a film from these: "

  # Add each film title to the prompt
  films.each do |film_title|
    prompt << "#{film_title}, "
   
  end

  prompt.chomp!(', ') # Remove the trailing comma and space
  prompt
end




end
