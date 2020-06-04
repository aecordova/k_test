document.addEventListener('turbolinks:load', () => {
  const filterSubmit = document.getElementById('filter-submit-btn');
  const babyFilter = document.getElementById('baby-filter');
  const assistantFilter = document.getElementById('assistant-filter');
  const statusFilter = document.getElementById('status-filter');
  const dataTable = document.getElementById('acts-table-body');

  const babyColumn = 0;
  const assistantColumn = 1;
  const statusColumn = 4;

  filterSubmit.addEventListener('click', () => {
    const filters = [
      babyFilter.value,
      assistantFilter.value,
      statusFilter.value,
    ];
    const columns = [babyColumn, assistantColumn, statusColumn];
    filterTable(dataTable, filters, columns, 'Todos');
  });


  const filterTable = (table, filters, columns, all) => {
    clearFilter(table);
    const { rows } = table;
    const matches = [];
    for (let i = 0; i < rows.length; i += 1) {
      const cellValues = [];
      const matched = false;
      columns.forEach((c) => {
        cellValues.push(rows[i].cells[c].textContent.toUpperCase());
      });
      cellValues.forEach((v, ind) => {
        if (filters[ind] === '' || filters[ind] === all) {
          matches[ind] = true;
        } else if (v === filters[ind].toUpperCase()) {
          matches[ind] = true;
        } else {
          matches[ind] = false;
        }
      });

      if (matches.includes(false)) {
        rows[i].style.display = 'none';
      }
    }
  };
});

const clearFilter = (table) => {
  for (let i = 0; i < table.rows.length; i += 1) {
    table.rows[i].style.display = '';
  }
};
