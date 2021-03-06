import { connect } from 'react-redux';
import { fetchAlbum } from '../../actions/album_actions';
import AlbumShow from './album_show';


const mapStateToProps = (state, ownProps) => {
    return {
      albumId: ownProps.params.albumId,
      currentAlbum: state.currentAlbum,
      currentUser: state.session.currentUser
  };
};

const mapDispatchToProps = (dispatch, ownProps) => {
  return {
    fetchAlbum: (albumId) => dispatch(fetchAlbum(albumId))
  };
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(AlbumShow);
