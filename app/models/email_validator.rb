require 'mail'

class EmailValidator
  attr_reader :email_address, :local_part, :domain_part

  def initialize(email_address)
    @raw_email_address = email_address

    begin
      @mail_address = Mail::Address.new(@raw_email_address)

      if valid?
        @email_address = @mail_address.address
        @local_part = @mail_address.local
        @domain_part = @mail_address.domain
      end
    rescue StandardError => e
    end
  end

  def valid?
    @valid ||= begin
      # We must check that value contains a domain and that value is an email address
      r = @mail_address.domain && @mail_address.address == @raw_email_address
      t = @mail_address.__send__(:tree)

      # We need to dig into treetop
      # A valid domain must have dot_atom_text elements size > 1
      # user@localhost is excluded
      # treetop must respond to domain
      # We exclude valid email values like <user@localhost.com>
      # Hence we use m.__send__(tree).domain
      r &&= (t.domain.dot_atom_text.elements.size > 1)
    rescue StandardError => e
      false
    end
  end
end