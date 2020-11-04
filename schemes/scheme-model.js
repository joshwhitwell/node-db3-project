// scheme-model
const db = require('../data/db-config')

function find() {
    return db('schemes')
}

function findById(id) {
    return db('schemes')
        .where({ id })
        .first()
        .then(res => {
            if (!res) {
                return null
            } else {
                return res
            }
        })
        .catch(err => {
            return err
        })
}

module.exports = {
    find,
    findById
}