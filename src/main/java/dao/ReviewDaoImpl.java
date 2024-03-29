package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.ReviewVo;

public class ReviewDaoImpl implements ReviewDao {

	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	@Override
	public List<ReviewVo> selectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("review.review_list");
	}
	
	@Override
	public List<ReviewVo> selectList(int m_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("review.review_list",m_idx);
	}

	
	@Override
	public List<ReviewVo> selectConditionList(Map map) {
		
		List<ReviewVo> list = null;
		
		//2.실행
		list = sqlSession.selectList("review.review_condition_list", map);
		
		
		return list;

	}

	@Override
	public int selectRowTotal() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("review.review_row_total");
	}

	@Override
	public int selectRowTotal(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("review.review_condition_row_total",map);
	}


	@Override
	public List<ReviewVo> selectList(String search_text) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("review.review_condition_total",search_text);
	}

	
	@Override
	   public ReviewVo selectOne(int review_idx) {
	      // TODO Auto-generated method stub
	      return sqlSession.selectOne("review.review_one",review_idx);
	   }

	   @Override
	   public int review_insertlike(ReviewVo vo) {
	      // TODO Auto-generated method stub
	      return sqlSession.insert("review.review_insertlike",vo);
	   }

	   @Override
	   public int review_deletelike(ReviewVo vo) {
	      // TODO Auto-generated method stub
	      return sqlSession.delete("review.review_deletelike",vo);

	   }
	   
      @Override
      public int update_readhit(int review_idx) {
         // TODO Auto-generated method stub
         return sqlSession.update("review.review_update_readhit", review_idx);
      }


	@Override
	public int insert(ReviewVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("review.review_insert", vo);	}


	@Override
	public int reply(ReviewVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int delete(int review_idx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("review.review_delete",review_idx);
	}


	@Override
	public int update(ReviewVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int update_step(ReviewVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int modify(ReviewVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("review.review_modify",vo);
	}   
      
   //mem_idx에 해당하는 review리스트 가져오기 
	@Override
   public List<ReviewVo> review_mem_list(Map map) {
      // TODO Auto-generated method stub
      return sqlSession.selectList("review.review_mem_list",map);
   }   
   
	@Override
	public List<ReviewVo> review_like_mem_list(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("review.review_like_mem_list",map);
	}       
   
   @Override
	public List<ReviewVo> best_selecList() {
		// TODO Auto-generated method stub
		
	   //베스트리뷰 중 최근에 고른 3개 가져오기
		List<ReviewVo> list = sqlSession.selectList("review.review_best_list");
		
		List<ReviewVo> review_list = new ArrayList<ReviewVo>() ;
		
		for(ReviewVo vo : list) {
			
			String	review_content =  vo.getReview_content();
			
			int start_index = review_content.indexOf("/upload/")+8;
			int end_index = 0;
			
			if(review_content.indexOf("png") != -1) {
				end_index = review_content.indexOf("png")+3;
				
			}else if(review_content.indexOf("jpg") != -1) {
				end_index = review_content.indexOf("jpg")+3;
				
			}else if(review_content.indexOf("jpeg") != -1) {
				end_index = review_content.indexOf("jpeg")+3;
			}
			
			//글내용에 사진이 있을 경우에만 작업하라
			if(end_index>0) {
				String review_content_url = review_content.substring(start_index, end_index);
				vo.setReview_thumbnail(review_content_url);
			}
			
			review_list.add(vo);
			
		}
		
		
		return review_list;
	}

	//베스트 리뷰 선택시 베스트리뷰 뷰에 추가
	@Override
	public int best_insert(int review_idx) {
		// TODO Auto-generated method stub
		return sqlSession.insert("review.review_best_insert", review_idx);
	}

   	

      


	
}
