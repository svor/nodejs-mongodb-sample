# Use base che-nodejs10-ubi image
FROM quay.io/eclipse/che-nodejs10-ubi:nightly

WORKDIR /nodejs-mongodb-sample

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy rest of the application csource code
COPY . .

# Run app.js with debugging port when container launches
ENTRYPOINT ["node", "--inspect=9229", "app.js"]

# Comment above and uncomment below to run app.js without debugger port when container launches
# ENTRYPOINT ["node", "app.js"]