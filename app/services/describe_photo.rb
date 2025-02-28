class DescribePhoto
  INSTRUCTIONS = <<~INSTRUCTIONS
  Describe the picture of the product with as much detail as possible. Include the following:
  Colors: Specify the main and secondary colors (e.g., navy, burgundy, emerald green). Mention any color-blocking or multiple color combinations (e.g., black sleeves with a white body).
  Material: Identify the fabric or material used (e.g., cotton, polyester, wool, denim, leather, silk, velvet, fleece). Describe the texture (e.g., soft, smooth, stretchy, stiff, ribbed, knitted).
  Neckline: Describe the neck style (e.g., round neck, V-neck, turtle neck, cowl neck, high neck, scoop neck, square neck, boat neck). Mention if it has any special elements like a pleated collar or a keyhole detail.
  Sleeve Style: Indicate the sleeve type (e.g., long sleeve, short sleeve, sleeveless, cap sleeve, bell sleeve, puff sleeve, raglan sleeve). Mention if the sleeves are rolled up or feature any details like elastic cuffs.
  Fit and Shape: Define the fit of the garment (e.g., loose, slim, tailored, oversized, regular fit, boxy, bodycon, cropped). For pants and skirts, mention if the fit is skinny, straight-leg, bootcut, flare, wide-leg, or palazzo. For dresses, mention if it's A-line, shift, pencil, or empire waist.
  Pockets: Count how many pockets the item has (e.g., 2 front pockets, 1 back pocket, side pockets, chest pocket, zippered pockets). Specify the placement (e.g., on the hips, chest area, or at the sides).
  Waist Style: For pants or skirts, mention the waist style (e.g., high-waisted, mid-rise, low-rise, paperbag waist). Also, note if the waist is elasticized or has a belt.
  Length: Mention the length of the garment (e.g., short, midi, long, ankle-length, knee-length). For pants or skirts, specify if they are cropped, full-length, or have a high-low hem.
  Holes, Rips, and Distressing: Note if the item has any rips, holes, distressing, or frayed edges, and specify their location (e.g., knee rips, torn hem, distressed fabric).
  Shoes: For footwear, mention the type (e.g., boots, sneakers, sandals, heels, flats, loafers, wedges, platform shoes). Indicate if they are high-top or low-top for shoes, or if they feature any unique details like lace-ups, buckles, or zippers.
  Laces or Zippers: Specify if the item has laces or zippers, and mention the color of the laces if applicable. For zippers, note if they are functional or decorative (e.g., front zipper, side zipper, ankle zipper).
  Extra Features and Details: Describe any additional features like extra zippers, patches, embroidery, studs, rivets, or rhinestones. Mention any logo or brand marking visible on the garment, and if it has any removable elements like belts, straps, or cuffs.
  Prints and Patterns: If the item has any print or pattern, mention the style (e.g., solid, plaid, striped, floral, animal print, camouflage, graphic text or logo). If there's text or a logo, describe it (e.g., bold red text on the chest, large logo print on the back).
  Functionality and Utility: Indicate if the garment has any functional features like drawstrings, adjustable straps, snap buttons, or hooks.
  Inner Layer or Lining: Describe if there is any visible inner lining or special material (e.g., fleece lining, quilted inner, faux fur lining). For coats, jackets, or outerwear, mention if the lining is insulated or padded.
  Brand or Designer: If visible, mention any designer logo, brand name, or emblem that could identify the item (e.g., a small "Nike" logo on the sleeve, a "Gucci" tag inside the collar).
  INSTRUCTIONS

  def initialize(photo_url)
    p @photo_url = photo_url
  end

  def call
    client = OpenAI::Client.new
    p messages = [
      { type: "text", text: INSTRUCTIONS },
      { type: "image_url", image_url: { url: @photo_url } }
    ]
    puts '-' * 50
    puts "Sending request to OpenAI API to describe the photo..."
    puts '-' * 50
    response = client.chat(parameters: {
      model: "gpt-4o-mini",
      messages: [{ role: "user", content: messages }],
      max_tokens: 2000,
    })
    p response.dig("choices", 0, "message", "content")
  end
end
