module.exports = {
  client: {
    service: {
      name: "local",
      localSchemaFile: "lib/schema.graphql",
    },
    includes: ["lib/graphql/**/*.graphql"],
  },
}
