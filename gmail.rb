require "temboo"
require "Library/Google"

class GmailHelper

    def initialize()
        # Set up your connection to Temboo.
        @session = TembooSession.new("anmol1771", 
                                     "SF", 
                                     "8896dc9a19f94248884de4369dd9b50f")
    end

    def send_email()
        # Instantiate the Choreo, using the session instance variable.
        email_choreo = Google::Gmail::SendEmail.new(@session)

        # Get an InputSet object for the choreo
        email_inputs = email_choreo.new_input_set()

        # Set this to the name of the Profile you created earlier.
        email_inputs.set_credential("A2")

        # Set inputs
        email_inputs.set_MessageBody("Hello, World!")
        email_inputs.set_Subject("Test from Temboo")
        email_inputs.set_FromAddress("anmol1771@gmail.com")
        # Set this to your email address.
        email_inputs.set_ToAddress("anmol@interaction-design.org")

        # Execute Choreo
        email_results = email_choreo.execute(email_inputs)
    end

end

instance = GmailHelper.new()
instance.send_email()