class StoredProductsController < ShopifyApp::AuthenticatedController
  before_action :set_stored_product, only: [:show, :edit, :update, :destroy]

  # GET /stored_products
  # GET /stored_products.json
  def index
    @stored_products = StoredProduct.all
  end

  def self.post_products
    require 'HTTParty'
    headers = {'X-Shopify-Access-Token' => @shop_session.token, 'Content-Type' => 'application/json'}
    base_uri = 'https://fbm2020-dev.myshopify.com/admin/products.json'
    
    StoredProduct.all.each do |c|
      products_hash = {}
      products_hash['title'] = c.title
      products_hash['body_html'] = c.body_html
      products_hash['vendor'] = c.vendor
      products_hash['product_type'] = c.product_type
      products_hash['published'] = c.published
      request = HTTParty.post(
        base_uri,
        :body => {
          :product => products_hash
        }.to_json,
        :headers => headers
      )
    end
  end

  # GET /stored_products/1
  # GET /stored_products/1.json
  def show
  end

  # GET /stored_products/new
  def new
    @stored_product = StoredProduct.new
  end

  # GET /stored_products/1/edit
  def edit
  end

  # POST /stored_products
  # POST /stored_products.json
  def create
    @stored_product = StoredProduct.new(stored_product_params)

    respond_to do |format|
      if @stored_product.save
        require 'HTTParty'
        headers = {'X-Shopify-Access-Token' => @shop_session.token, 'Content-Type' => 'application/json'}
        base_uri = 'https://fbm2020-dev.myshopify.com/admin/products.json'
        
        StoredProduct.all.each do |c|
          products_hash = {}
          products_hash['title'] = c.title
          products_hash['body_html'] = c.body_html
          products_hash['vendor'] = c.vendor
          products_hash['product_type'] = c.product_type
          products_hash['published'] = c.published
          request = HTTParty.post(
            base_uri,
            :body => {
              :product => products_hash
            }.to_json,
            :headers => headers
          )
          
        end
        format.html { redirect_to @stored_product, notice: 'Stored product was successfully created.' }
        format.json { render :show, status: :created, location: @stored_product }
      else
        format.html { render :new }
        format.json { render json: @stored_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stored_products/1
  # PATCH/PUT /stored_products/1.json
  def update
    respond_to do |format|
      if @stored_product.update(stored_product_params)
        format.html { redirect_to @stored_product, notice: 'Stored product was successfully updated.' }
        format.json { render :show, status: :ok, location: @stored_product }
      else
        format.html { render :edit }
        format.json { render json: @stored_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stored_products/1
  # DELETE /stored_products/1.json
  def destroy
    @stored_product.destroy
    respond_to do |format|
      format.html { redirect_to stored_products_url, notice: 'Stored product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stored_product
      @stored_product = StoredProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stored_product_params
      params.require(:stored_product).permit(:title, :body_html, :vendor, :product_type, :published)
    end
end
