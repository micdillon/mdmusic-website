class Admin::ContactsController < ApplicationController
  # GET /contacts
  # GET /contacts.xml
  def index
    @admin_contacts = Contact.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @admin_contacts }
    end
  end

  # GET /contacts/1
  # GET /contacts/1.xml
  def show
    @admin_contact = Contact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @admin_contact }
    end
  end

  # GET /contacts/new
  # GET /contacts/new.xml
  def new
    @admin_contact = Contact.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @admin_contact }
    end
  end

  # GET /contacts/1/edit
  def edit
    @admin_contact = Contact.find(params[:id])
  end

  # POST /contacts
  # POST /contacts.xml
  def create
    @admin_contact = Contact.new(params[:contact])

    respond_to do |format|
      if @admin_contact.save
        format.html { redirect_to(@admin_contact, :notice => 'Contact was successfully created.') }
        format.xml  { render :xml => @admin_contact, :status => :created, :location => @admin_contact }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @admin_contact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contacts/1
  # PUT /contacts/1.xml
  def update
    @admin_contact = Contact.find(params[:id])

    respond_to do |format|
      if @admin_contact.update_attributes(params[:contact])
        format.html { redirect_to(@admin_contact, :notice => 'Contact was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @admin_contact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.xml
  def destroy
    @admin_contact = Contact.find(params[:id])
    @admin_contact.destroy

    respond_to do |format|
      format.html { redirect_to(contacts_url) }
      format.xml  { head :ok }
    end
  end

	def frontend
		@admin_contacts = Contact.all
		render 'frontend', :layout => false
	end

end
