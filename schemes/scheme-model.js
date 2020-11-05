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

function findSteps(id) {
    return db('schemes')
        .join('steps', 'schemes.id', 'steps.scheme_id')
        .select('steps.id', 'schemes.scheme_name', 'steps.step_number', 'steps.instructions')
        .where({ 'schemes.id': id })
        .orderBy('steps.step_number')
}

function add(scheme) {
    return db('schemes')
        .insert(scheme)
}

function update(scheme, id) {
    return db('schemes')
        .where({ id })
        .update(scheme)
}

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update
}