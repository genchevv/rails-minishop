## Models
- Product
    - title:string
    - description:string
    - price:float

- Order
    - total_price:float
    - Buyer:references

- Buyer
    - address:string
    - zip_code:integer
    - city:string
    - first_name:string
    - last_name:string
    - email:string

- OrderItem
    - Product:references
    - Order:references
    - Quantity:integer