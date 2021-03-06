export const fetchArtist = id => (
  $.ajax({
    method: 'GET',
    url: `api/users/${id}`,
    error: (err) => console.log(err)
  })
);

export const searchArtists = query => (
  $.ajax({
    method: 'GET',
    url: 'api/users',
    dataType: 'json',
    data: { query }
  })
);
