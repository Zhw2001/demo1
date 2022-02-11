function composeTree (list) {
    const data = JSON.parse(JSON.stringify(list))
    const result = []
    if (!Array.isArray(data)) {
        return result
    }
    data.forEach(item => {
        item.value = item.id
        item.label = item.name
        delete item.children
    })
    const map = {}
    data.forEach(item => {
        map[item.id] = item
    })
    data.forEach(item => {
        const parent = map[item.parent_id]
        if (parent) {
        (parent.children || (parent.children = [])).push(item)
        } else {
        result.push(item)
        }
    })

    return result
}

export { composeTree }
